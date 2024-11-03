package ${package}.mixins;

import org.spongepowered.asm.mixin.injection.Redirect;

@Mixin(value = BiomeSource.class, priority = 800) //set this to a random value that isn't 800
public abstract class BiomeSourceMixin {

	@Redirect(method = "possibleBiomes", at = @At(value = "INVOKE", target = "Ljava/util/function/Supplier;get()Ljava/lang/Object;"))
	private Object getBiomes(Supplier<Set<Holder<Biome>>> instance) {
		return modifyBiomeSet(instance.get());
	}

	protected Set<Holder<Biome>> modifyBiomeSet(Set<Holder<Biome>> biomes) {
	    return biomes;
    }

}
