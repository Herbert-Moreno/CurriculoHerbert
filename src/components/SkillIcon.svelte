<script lang="ts">
    let {
        href = "",
        icon = "c",
    } = $props();
</script>

<a href={href}>
  <img 
    style="
    width: {48}px;
    height: {48}px;
    "
    src="https://skills.syvixor.com/api/icons?i={icon}" 
    alt="skill icons"/>
</a>