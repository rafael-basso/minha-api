# 1. Escolha uma imagem base estável e otimizada
FROM python:3.11-slim

# 2. Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copie o arquivo de dependências
COPY requirements.txt .

# 4. Instale as dependências
# A flag --no-cache-dir reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copie o restante do código da aplicação
COPY . .

# 6. Exponha a porta que a aplicação vai usar
EXPOSE 8000

# 7. Defina o comando para rodar a aplicação quando o contêiner iniciar
# Use 0.0.0.0 para tornar a aplicação acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]