# Medicover - AI Medical Assistant 🏥

## 🚀 Project Overview
**Medicover** is an intelligent medical chatbot powered by **Retrieval Augmented Generation (RAG)** architecture. It provides accurate medical information by combining document retrieval with Google's Gemini 2.5 Pro AI model. The system processes medical PDFs, creates semantic embeddings, and delivers contextual responses to medical queries.

## ✨ Key Features
- **🤖 AI-Powered Q&A**: Uses Google Gemini 2.5 Pro for intelligent medical responses
- **📚 Document Processing**: Automated PDF extraction and chunking (500 chars with 20 overlap)
- **🔍 Vector Search**: Pinecone database with 384-dimensional embeddings for similarity search
- **⚡ Real-time Retrieval**: Returns top-3 most relevant documents for context
- **🔒 Secure API Management**: Environment-based API key handling
- **☁️ Production Ready**: CI/CD pipeline with GitHub Actions and Azure deployment

## 🏗️ Architecture

### RAG Pipeline
```
PDF Documents → Text Extraction → Chunking → Embeddings → Pinecone Vector DB
                                                              ↓
User Query → Embedding → Similarity Search → Retrieved Context → Gemini 2.5 Pro → Response
```

### Technical Stack
- **AI Model**: Google Gemini 2.5 Pro (gemini-2.0-flash-exp)
- **Vector Database**: Pinecone (384-dim, cosine similarity)
- **Embeddings**: HuggingFace sentence-transformers/all-MiniLM-L6-v2
- **Framework**: LangChain for RAG implementation
- **Backend**: Python with Flask/FastAPI
- **Deployment**: Azure with GitHub Actions CI/CD

## 📁 Project Structure

```
medicover/
├── 📄 app.py                 # Main Flask application
├── 📄 store_index.py         # Vector store creation and indexing
├── 📂 src/                   # Core modules
│   ├── 📄 helper.py          # PDF processing & embedding functions
│   ├── 📄 prompt.py          # Prompt templates and configurations
│   └── 📄 __init__.py        # Package initialization
├── 📂 data/                  # Medical PDF documents
│   └── 📄 medi_book.pdf      # Sample medical reference book
├── 📂 research/              # Development & experiments
│   └── 📓 trials.ipynb       # Jupyter notebook for testing
├── 📂 templates/             # Web interface templates
├── 📂 static/                # CSS and static assets
├── 📄 requirements.txt       # Python dependencies
├── 📄 .env                   # Environment variables (API keys)
├── 📄 Dockerfile            # Container configuration
└── 📄 README.md             # Project documentation
```

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- Pinecone API Key
- Google Gemini API Key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AdityaDeshmukh2023/Medicover.git
   cd Medicover
   ```

2. **Set up virtual environment**
   ```bash
   python -m venv .venv
   # Windows
   .venv\Scripts\activate
   # Linux/Mac
   source .venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables**
   Create `.env` file:
   ```env
   PINECONE_API_KEY=your_pinecone_api_key
   GEMINI_API_KEY=your_gemini_api_key
   ```

5. **Initialize vector database**
   ```bash
   python store_index.py
   ```

6. **Run the application**
   ```bash
   python app.py
   ```

## 💡 Usage

### Web Interface
1. Open browser to `http://localhost:5000`
2. Ask medical questions like:
   - "What is diabetes?"
   - "What are the symptoms of hypertension?"
   - "How is pneumonia treated?"

### API Endpoints
```python
POST /ask
{
    "question": "What is the treatment for acne?"
}
```

Response:
```json
{
    "answer": "Acne treatment typically involves topical retinoids, antibiotics, and in severe cases, oral medications. The treatment approach depends on the severity and type of acne.",
    "sources": ["medical_reference.pdf", "dermatology_guide.pdf"]
}
```

## 🔧 Core Components

### 1. Document Processing (`src/helper.py`)
- **PDF Extraction**: Uses PyPDFLoader for text extraction
- **Text Chunking**: RecursiveCharacterTextSplitter (500 chars, 20 overlap)
- **Embeddings**: HuggingFace sentence-transformers

### 2. Vector Storage (`store_index.py`)
- **Pinecone Setup**: Creates/connects to "medical-chatbot" index
- **Document Indexing**: Stores embeddings with metadata
- **Similarity Search**: Cosine similarity for retrieval

### 3. RAG Chain (`app.py`)
- **Retrieval**: Gets top-3 similar documents
- **Generation**: Gemini 2.5 Pro with medical context
- **Response**: Structured medical answers

## 📊 Performance Metrics
- **Embedding Dimension**: 384
- **Chunk Size**: 500 characters
- **Retrieval Count**: Top-3 documents
- **Response Temperature**: 0.3 (consistent medical advice)
- **Search Metric**: Cosine similarity

## 🚀 Deployment

### Docker Deployment
```bash
docker build -t medicover .
docker run -p 5000:5000 --env-file .env medicover
```

### Azure Deployment
The project includes GitHub Actions CI/CD pipeline for automatic Azure deployment:
- **Build**: Automated testing and dependency installation
- **Deploy**: Azure App Service deployment
- **Environment**: Secure environment variable management

## 🛠️ Development

### Running Tests
```bash
# Run notebook experiments
jupyter notebook research/trials.ipynb

# Test individual components
python src/helper.py
python store_index.py
```

### Adding New Documents
1. Place PDF files in `data/` directory
2. Run `python store_index.py` to reindex
3. New documents automatically available for queries

## 🤝 Contributing
1. Fork the repository
2. Create feature branch (`git checkout -b feature/medical-feature`)
3. Commit changes (`git commit -m 'Add medical feature'`)
4. Push to branch (`git push origin feature/medical-feature`)
5. Open Pull Request

## 📝 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments
- **Google Gemini**: Advanced AI model for medical responses
- **Pinecone**: Vector database for semantic search
- **LangChain**: RAG framework implementation
- **HuggingFace**: Pre-trained embedding models

## 📧 Contact
**Aditya Deshmukh** - [@AdityaDeshmukh2023](https://github.com/AdityaDeshmukh2023)

Project Link: [https://github.com/AdityaDeshmukh2023/Medicover](https://github.com/AdityaDeshmukh2023/Medicover)
