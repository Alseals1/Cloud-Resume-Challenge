import { useEffect, useState } from "react"

export default function VisitorCounter() {
  const [visits, setVisits] = useState<number | null>(null)
  const apiUrl = import.meta.env.VITE_API_URL

  useEffect(() => {
    fetch(apiUrl)
      .then((res) => res.json())
      .then((data) => setVisits(data.visits))
      .catch((err) => console.error("Visitor counter error:", err))
  }, [apiUrl])

  return (
    <div className="text-center mt-4">
      <p className="text-gray-600">Visitor</p>
      <h2 className="text-2xl font-bold">{visits ?? "Loading..."} </h2>
    </div>
  )
}
