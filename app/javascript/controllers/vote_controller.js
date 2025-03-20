import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["upvoteCount", "downvoteCount"];

  connect() {
    this.upvotes = 0;
    this.downvotes = 0;
  }

  upvote() {
    this.upvotes += 1;
    this.upvoteCountTarget.textContent = this.upvotes;
  }

  downvote() {
    this.downvotes += 1;
    this.downvoteCountTarget.textContent = this.downvotes;
  }
}
