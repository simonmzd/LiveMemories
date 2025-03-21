import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["upvoteCount", "downvoteCount"];

  connect() {
    this.upvotes = 0;
    this.downvotes = 0;
    this.userVote = null;
  }

  upvote() {
    if (this.userVote === "up") {
      this.upvotes -= 1;
      this.upvoteCountTarget.textContent = this.upvotes;
      this.userVote = null;
      return;
    }

    if (this.userVote === "down") {
      this.downvotes -= 1;
      this.downvoteCountTarget.textContent = this.downvotes;
    }

    this.upvotes += 1;
    this.upvoteCountTarget.textContent = this.upvotes;
    this.userVote = "up";
  }

  downvote() {
    if (this.userVote === "down") {
      this.downvotes -= 1;
      this.downvoteCountTarget.textContent = this.downvotes;
      this.userVote = null;
      return;
    }

    if (this.userVote === "up") {
      this.upvotes -= 1;
      this.upvoteCountTarget.textContent = this.upvotes;
    }

    this.downvotes += 1;
    this.downvoteCountTarget.textContent = this.downvotes;
    this.userVote = "down";
  }
}
