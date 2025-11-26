# N8N YouTube Clipper - Railway Deployment

This deploys N8N with:
- YouTube video downloading (yt-dlp)
- Video processing (FFmpeg)
- AI content generation (Groq)
- Cloud video hosting (Cloudinary)

## Required Environment Variables

Set these in Railway:

- `N8N_BASIC_AUTH_ACTIVE=true`
- `N8N_BASIC_AUTH_USER=admin`
- `N8N_BASIC_AUTH_PASSWORD=your_secure_password`
- `GROQ_API_KEY=gsk_...`
- `CLOUDINARY_CLOUD_NAME=your_cloud_name`
- `CLOUDINARY_UPLOAD_PRESET=your_preset`

## Deployment

1. Push to GitHub
2. Connect to Railway
3. Add environment variables
4. Deploy!