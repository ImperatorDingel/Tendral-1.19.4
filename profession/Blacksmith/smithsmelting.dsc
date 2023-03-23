SmithSmelting:
    type: world
    debug: true
    events:
        on furnace smelts item into tendral_*_ingot:
        - determine <context.result_item.with[quantity=<context.source_item.script.data_key[data.output]>]>

