import { useEffect, useState } from "react"

declare const process: { env: { API_URL?: string } }

export default function VisitorCounter() {
  const [visits, setVisits] = useState<number | null>(null)

  useEffect(() => {
    const apiUrl = process.env.API_URL ?? "/api/visitors"
    fetch(apiUrl)
      .then((res) => res.json())
      .then((data) => setVisits(data.visits))
      .catch((err) => console.error(err))
  }, [])

  return (
    <div className="text-center mt-4">
      <p className="text-gray-600">Visitor Count:</p>
      <h2 className="text-2xl font-bold">{visits ?? "Loading..."}</h2>
    </div>
  )
}