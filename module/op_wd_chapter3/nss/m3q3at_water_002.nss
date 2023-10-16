//* Destroy one of the fire elemental spawns
void main()
{
if(GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_01")) == TRUE)
    {
    //* Destroy First Brazier, Pedastals and Fire Elementals
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_01",OBJECT_SELF,4));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_01",OBJECT_SELF,3));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_01",OBJECT_SELF,2));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_01",OBJECT_SELF,1));
    object oBrazier = GetObjectByTag("M3Q3B_FIRE_SPAWN_01");
    location lLocal = GetLocation(oBrazier);
    DelayCommand(1.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLocal));
    DestroyObject(oBrazier, 1.0);
    DestroyObject(GetObjectByTag("M3Q3FIREELEM1"));
    DestroyObject(GetObjectByTag("M3Q3FIREELEM2"));
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_M),GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF,2.0);
    }
else if(GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_02")) == TRUE)
    {
    //* Destroy Second Brazier, Pedastals and Fire Elementals
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_02",OBJECT_SELF,4));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_02",OBJECT_SELF,3));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_02",OBJECT_SELF,2));
    DestroyObject(GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_02",OBJECT_SELF,1));
    object oBrazier = GetObjectByTag("M3Q3B_FIRE_SPAWN_02");
    location lLocal = GetLocation(oBrazier);
    DelayCommand(1.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLocal));
    DestroyObject(oBrazier, 1.0);
    DestroyObject(GetObjectByTag("M3Q3FIREELEM3"));
    DestroyObject(GetObjectByTag("M3Q3FIREELEM4"));
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_M),GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF,2.0);
    }
}
