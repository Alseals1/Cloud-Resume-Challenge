function Skills() {
  return (
    <section className="bg-white rounded-2xl shadow-sm p-6">
      <h2 className="text-2xl font-semibold mb-4">Technical Skills</h2>
      <div className="grid md:grid-cols-2 gap-6">
        <div>
          <h3 className="font-medium text-gray-900 mb-2">Cloud & DevOps</h3>
          <ul className="list-disc list-inside text-gray-700 space-y-1">
            <li>AWS (Lambda, S3, API Gateway, DynamoDB, CloudFront, IAM)</li>
            <li>Terraform & CloudFormation</li>
            <li>GitHub Actions (CI/CD)</li>
            <li>Docker, Serverless Framework</li>
          </ul>
        </div>
        <div>
          <h3 className="font-medium text-gray-900 mb-2">Development</h3>
          <ul className="list-disc list-inside text-gray-700 space-y-1">
            <li>React, TypeScript, Node.js, Express.js</li>
            <li>Python, RESTful APIs</li>
            <li>MySQL, PostgreSQL, DynamoDB, Supabase</li>
            <li>SwiftUI (iOS Development)</li>
          </ul>
        </div>
      </div>
    </section>
  )
}

export default Skills
