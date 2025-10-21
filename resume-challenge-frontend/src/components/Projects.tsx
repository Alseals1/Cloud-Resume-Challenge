function Projects() {
  return (
    <section className="bg-white rounded-2xl shadow-sm p-6">
      <h2 className="text-2xl font-semibold mb-4">Highlighted Projects</h2>
      <div className="space-y-6">
        <div>
          <h3 className="text-xl font-semibold text-gray-900">
            Cloud Resume Challenge
          </h3>
          <p className="text-gray-700 mt-1">
            A full stack serverless project showcasing cloud engineering and
            automation skills through AWS services and IaC practices.
          </p>
          <ul className="list-disc list-inside text-gray-700 mt-2">
            <li>Frontend: React + TypeScript</li>
            <li>
              Backend: AWS (API Gateway, Lambda, DynamoDB, S3, CloudFront)
            </li>
            <li>IaC: Terraform</li>
            <li>CI/CD: GitHub Actions</li>
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-semibold text-gray-900">
            Edfarm Spaces (AI Agent Platform)
          </h3>
          <p className="text-gray-700 mt-1">
            An intelligent workspace integrating AI agents collaboration tools
            for education and research.
          </p>
          <ul className="list-disc list-inside text-gray-700 mt-2">
            <li>Frontend: React + TypeScript</li>
            <li>Backend: Supabase</li>
            <li>Orchestration: Mastro AI</li>
            <li>CI: GitHub Actions</li>
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-semibold text-gray-900">Edfarm Learn</h3>
          <p className="text-gray-700 mt-1">
            An online learning management platform providing interactive courses
            and analytics for learners.
          </p>
          <ul className="list-disc list-inside text-gray-700 mt-2">
            <li>Frontend: React</li>
            <li>Backend: ExpressJS + MySQL</li>
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-semibold text-gray-900">
            Movement Website
          </h3>
          <p className="text-gray-700 mt-1">
            A modern, platform built to share truthful history of Birmingham’s
            Civil Rights through the storytelling lens of youth justice leaders
          </p>
          <ul className="list-disc list-inside text-gray-700 mt-2">
            <li>Frontend: AstroJS</li>
            <li>Backend: Express + Payload CMS</li>
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-semibold text-gray-900">
            Movement iOS App
          </h3>
          <p className="text-gray-700 mt-1">
            A native iOS app designed built to share truthful history of
            Birmingham’s Civil Rights through the storytelling lens of youth
            justice leaders
          </p>
          <ul className="list-disc list-inside text-gray-700 mt-2">
            <li>Frontend: SwiftUI</li>
            <li>Backend: Express + Strapi CMS</li>
          </ul>
        </div>
      </div>
    </section>
  )
}

export default Projects
