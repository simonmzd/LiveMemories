import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["upvoteCount", "downvoteCount", "upvoteButton", "downvoteButton"];

  connect() {
    this.contentId = this.element.dataset.contentId;
  }

  async upvote() {
    await this.vote(1);
  }

  async downvote() {
    await this.vote(-1);
  }

  async vote(value) {
    try {
      const response = await fetch(`/concerts/${this.concertId}/contents/${this.contentId}/votes`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ value: value })
      });

      if (!response.ok) throw new Error("Erreur lors du vote");

      const data = await response.json();

      this.updateVoteCounts(data.upvotes, data.downvotes);

      this.updateButtonStyles(data.userVote);

    } catch (error) {
      console.error(error);
    }
  }

  updateVoteCounts(upvotes, downvotes) {
    this.upvoteCountTarget.textContent = upvotes;
    this.downvoteCountTarget.textContent = downvotes;
  }

  updateButtonStyles(userVote) {
    if (userVote === 1) {
      this.upvoteButtonTarget.classList.add("active");
      this.downvoteButtonTarget.classList.remove("active");
    } else if (userVote === -1) {
      this.downvoteButtonTarget.classList.add("active");
      this.upvoteButtonTarget.classList.remove("active");
    } else {
      this.upvoteButtonTarget.classList.remove("active");
      this.downvoteButtonTarget.classList.remove("active");
    }
  }
}
