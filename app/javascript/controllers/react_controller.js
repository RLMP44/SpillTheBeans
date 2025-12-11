import { Controller } from "@hotwired/stimulus"
import React from "react"
import { createRoot } from "react-dom/client"
import Checklist from "../components/Checklist.jsx"

export default class extends Controller {
  connect() {
    const root = createRoot(this.element)
    const ingredientsAsJSON = this.element.dataset.reactIngredients
    const ingredients = JSON.parse(ingredientsAsJSON)
    root.render(<Checklist ingredients={ingredients} />)
  }
}
