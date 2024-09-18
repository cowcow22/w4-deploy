FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Set Bun in PATH
ENV PATH="/root/.bun/bin:$PATH"

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and bun.lockb files
COPY package*.json bun.lockb* ./

# Install dependencies using Bun
RUN bun install

# Copy the rest of the application code
COPY . .

# Expose the default Vue.js dev server port
EXPOSE 3000

# Start the Vue.js development server using Bun
CMD ["bun", "run", "dev"]
