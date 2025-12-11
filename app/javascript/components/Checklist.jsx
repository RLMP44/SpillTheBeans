import React from "react"

export default function Checklist({ ingredients }) {
  return (
    <div className="form-check">
      {ingredients.map((ingredient) => {
        return (
          <div key={ingredient.id} id={`check-${ingredient.id}`} >
            <input className="form-check-input" type="checkbox" value="" />
            <label className="form-check-label" htmlFor={`check-${ingredient.id}`}>
              {ingredient.amount} {ingredient.name}
            </label>
          </div>
        )
      })}
    </div>
  )
}
