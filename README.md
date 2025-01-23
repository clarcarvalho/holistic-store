# Holistic Store

Siga os passos abaixo para configurar e rodar o projeto Holistic Store no seu ambiente de desenvolvimento:

---

### **Pré-requisitos**
- Ter o [Flutter](https://docs.flutter.dev/get-started/install) (Versão 3.27.2) instalado em sua máquina.
- Certifique-se de que os SDKs necessários (Android/iOS) estão instalados e configurados corretamente.

---

### **Passos para Rodar o Projeto**

1. **Instalar as dependências do Flutter**
   Navegue até a pasta do projeto no terminal e execute o comando abaixo para instalar as dependências:
   ```bash
   flutter pub get
   ```

2. **Verificar a configuração do ambiente**
   Utilize o comando a seguir para verificar se o ambiente está configurado corretamente:
   ```bash
   flutter doctor
   ```
   Revise o output para identificar e corrigir eventuais problemas.

3. **Listar os emuladores disponíveis**
   Execute o comando abaixo para listar os emuladores configurados no seu sistema:
   ```bash
   flutter emulators
   ```

4. **Selecionar e copiar o ID do emulador desejado**
   No output do comando anterior, copie o ID do emulador que você deseja usar.

5. **Iniciar o emulador**
   Substitua `<emulator_id>` pelo ID do emulador copiado e execute o comando:
   ```bash
   flutter emulators --launch <emulator_id>
   ```

6. **Rodar o projeto no emulador**
   Com o emulador aberto, inicie o projeto com o comando:
   ```bash
   flutter run
   ```
Para acessar o sistema, utilize as seguintes credenciais:
E-mail: clara.carvalho@email.com
Senha: 123456
Made with love by Clara 🖤
