# The Cloud Resume Challenge

This repository documents my journey through **The Cloud Resume Challenge** by [Forrest Brazeal](https://cloudresumechallenge.dev/). The challenge is designed to help aspiring Cloud Engineers build hands on cloud skills while showcasing a real-world, full-stack cloud project.

---

## Overview

I’m completing this challenge using an **Agile Sprint structure**, where each week represents one **Sprint** focused on a major milestone of the project.  
Each **Sprint** maps to a **Chunk** from the Cloud Resume Challenge book:

| Sprint |  Chunk  | Focus                                                |
| :----: | :-----: | :--------------------------------------------------- |
|   1    | Chunk 1 | Frontend: Static site + resume hosting               |
|   2    | Chunk 2 | Backend: API + database integration                  |
|   3    | Chunk 3 | Automation: Infrastructure as Code (IaC) + CI/CD     |
|   4    | Chunk 4 | Optimization: Monitoring, security, and final polish |

This approach allows me to stay organized, iterate weekly, and treat the challenge like a real-world engineering project.

---

## Tech Stack

**Frontend**

- HTML, CSS, JavaScript (or React)
- Hosted via Amazon S3 + CloudFront (CDN)
- HTTPS enabled with AWS Certificate Manager (ACM)

**Backend**

- AWS Lambda (Node.js)
- API Gateway
- DynamoDB (for visitor counter)

**Infrastructure as Code**

- Terraform
- Version controlled via Git

**Automation**

- GitHub Actions for CI/CD pipeline

---

## Repository Structure

```
cloud-resume-challenge
  .github/workflows/
    frontend-ci.yaml
  backend
    terraform
      main.tf
      output.tf
      provider.tf
      variable.tf
    lambda
      lambda.py
  frontend
    infrastructure
      terraform
        main.tf
        output.tf
        provider.tf
        variable.tf
    resume-callenge-frontend
  
```

---

## Progress Tracking

All tasks and reflections are tracked in **Notion**, with each Sprint focused on completing a major deliverable. Each Sprint concludes with:

- Completed milestones
- Lessons learned
- Retrospective and next Sprint plan

## Going to stay private till I learn to share public lol!!

---

## Goal

By the end of this challenge, I’ll have:

- A live, serverless cloud-hosted resume
- Automated infrastructure deployments
- A well-structured DevOps workflow
- A public record of my cloud engineering progress

---

## Additional Info

- Challenge: [The Cloud Resume Challenge](https://cloudresumechallenge.dev/)
- Author: [Forrest Brazeal](https://forrestbrazeal.com/)

Let's also connect on [LinkedIn](https://www.linkedin.com/in/alandisseals/)
