<select name="[{$name}]"
    class="form-select[{if $class}] [{$class}][{/if}]"
    [{if $id}]id="[{$id}]"[{/if}]
    [{if $required}]required[{/if}]>
    <option value=" "[{if empty($value)}] selected[{/if}]>[{oxmultilang ident="NOT_SPECIFIED"}]</option>
    <option value="MRS"[{if $value|lower  == "mrs" or $value2|lower == "mrs"}] selected[{/if}]>[{oxmultilang ident="MRS"}]</option>
    <option value="MR"[{if $value|lower  == "mr"  or $value2|lower == "mr"}] selected[{/if}]>[{oxmultilang ident="MR" }]</option>
</select>
