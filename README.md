# HorizonLM-Lab

Projeto experimental Android para testar um launcher de Minecraft Java com foco em compatibilidade, estabilidade e FPS sustentado.

## Status em 05/11/2026

**HorizonLM Java Alpha**: workflow que baixa uma revisão fixa do projeto aberto `ZalithLauncher2`, aplica identificador Android próprio e nome "HorizonLM - Modificacao nao oficial" e tenta compilar um APK ARM64 de depuração. A existência deste workflow não garante que a compilação ou a inicialização no celular já tenha passado.

- [Compilar HorizonLM Java Alpha](.github/workflows/horizonlm-java-alpha.yml)
- [Compilar launcher original de referência](.github/workflows/minecraft-reference.yml)
- [GitHub Actions: acompanhar execuções](../../actions)

### Como obter o APK

Abra **Actions**, escolha **HorizonLM Java Alpha - APK ARM64**, execute **Run workflow** (ou abra a execução automática), espere o job terminar com status verde e baixe o artefato **HorizonLM-Java-Alpha-ARM64-APK**. Extraia o ZIP no Android e instale o `.apk`. Se o job falhar, analise os logs primeiro; não haverá APK válido.

### Limitações reais

- Este primeiro Android Java Alpha **não integra Horizon Rust**, nem implementação nova de renderer; não faz promessas de FPS.
- A base Java vem do código aberto e executa Minecraft Java em dispositivos compatíveis. Compatibilidade com versões específicas, loaders, shaderpacks e mods requer testes reais.
- Serviços de conta oficial podem precisar de configuração OAuth adequada. Não coloque senhas ou tokens no repositório.
- O APK `Debug` usa assinatura de desenvolvimento do build; versões feitas em execuções diferentes podem exigir desinstalar antes de atualizar. Faça backup de saves.
- Este repositório **não inclui os arquivos proprietários do Minecraft**.
- O protótipo anterior de auditoria de mods `HorizonLM Lab 0.1.1` **não é um launcher jogável** e ainda não foi importado neste repositório.

### Fonte, atribuição e licença

Esta versão Java Alpha deriva, durante a build, do repositório [ZalithLauncher/ZalithLauncher2](https://github.com/ZalithLauncher/ZalithLauncher2) sob **GPLv3** e seus termos adicionais: projeto modificado, não oficial, sem uso do nome ou marca original no aplicativo distribuído; os avisos de copyright originais permanecem. O código-fonte correspondente é a revisão upstream fixa `3ad5a786b042a6e8f0953b8697f00e9c2b89fdc9` com as transformações explícitas do workflow. Não é uma versão endossada pelos mantenedores upstream.

O workflow **Minecraft Java de referência** baixa a mesma revisão sem modificar e permite investigar se falhas são introduzidas pela nossa personalização ou se já existem na base.

**Próximas provas**: build ARM64; auditoria do APK; instalação e abertura; download de versão; mundo local; Forge 1.20.1 + mods; comparativo de p50/p99 frame time, temperatura e FPS sustentado no dispositivo real.
