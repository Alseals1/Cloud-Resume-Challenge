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

- Terraform, AWS CloudFormation, _or_ SAM (I have to choose which one I want to go with)
- Version controlled via Git

**Automation**

- GitHub Actions for CI/CD pipeline

---

## Repository Structure

```
cloud-resume-challenge/
│
├── README.md                # Summary (this file)
│
├── frontend/
│   ├── README.md            # Frontend setup, deployment steps
│   └── ...                  # Source files for the website
│
├── infratrucre/
│   ├── README.md            # Backend API setup, Lambda & DB integration
│   └── ...                  # Source code and infrastructure templates
│
└── .github/workflows/       # CI/CD automation files
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
