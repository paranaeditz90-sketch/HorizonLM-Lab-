# Protocolo de testes HorizonLM (Android)

## Portão 0 — compilação
- O workflow ARM64 termina com sucesso.
- Existe artefato APK com tamanho não zero.
- `unzip -t` valida a integridade do arquivo.
- O APK é da variante **HorizonLM não oficial**; não confundir com o APK oficial de referência.

## Portão 1 — inicialização
- Instalar em aparelho físico, abrir três vezes e retornar à tela inicial.
- Confirmar que mantém arquivos de configuração após fechar.
- Verificar logcat por `FATAL EXCEPTION`, `SIGSEGV`, `OutOfMemoryError`.
- Testar offline antes de qualquer conta: autenticação Microsoft/OAuth da variante ainda precisa de validação independente.

## Portão 2 — versões
Testar uma versão por vez: 1.8.9, 1.12.2, 1.16.5, 1.20.1 e uma 1.21.x compatível com o instalador. A aceitação não é automática só por aparecer na lista.

## Portão 3 — mods
1. Vanilla 1.20.1, 15 min de jogo;
2. Forge 1.20.1 com 1 mod simples;
3. Forge 1.20.1 com mod GeckoLib;
4. Pack real com 50, depois 100, depois **200+ mods**, mantendo uma lista exata de JARs e versões;
5. Alternar renderizador e validar shaders separadamente;
6. Só então combinar 200 mods + shaders.

Os parâmetros devem ser iguais entre a versão original de referência e o HorizonLM Alpha. Não prometer compatibilidade universal: APIs gráficas, Mixins e JNI podem impedir execução.

## Portão 4 — qualidade de quadros
- Capturar pelo menos cinco minutos de medição por cenário; repetir após aquecimento.
- Comparar **FPS médio, 1% low, p50/p95/p99 de frametime, quedas e tempo de carregamento de chunks**.
- Registrar temperatura, estado da bateria, resolução interna, distância de render, limite de FPS, RAM configurada e clock de CPU/GPU se disponível.
- Não usar FPS do emulador Android como previsão do celular.
- Só considerar 'melhor desempenho' quando melhoria mensurável e repetível superar a variação entre execuções.

## Portão 5 — recuperação
- Testar cancelamento de download, espaço insuficiente, JAR truncado, mod incompatível, app em segundo plano, alternância de orientação e perda de rede.
- Salvar antes de atualizar; nunca apagar mundos ou configurações durante diagnósticos.
- Se falhar, preservar log, versão, modlist e último perfil funcional.

## Limitações iniciais
Os workflows atuais compilam e tentam iniciar uma variante do motor Java. **Horizon nativo Rust, aceleração Mali nova, telemetria interna de frames e otimizações específicas ainda não foram implementados.** A primeira meta é estabelecer um launcher que abra; depois medir e otimizar de forma controlada.
