// * If a Dragon orb is in here then
// * Create a full or empty dragon orb based on
// * whether the dragon in this area is alive or dead
void main()
{
  object oItem = GetInventoryDisturbItem();
  if (GetTag(oItem) == "M3Q04G_Sphere")
  {
    effect eVis = EffectVisualEffect(VFX_FNF_PWKILL);
    object oDragon = GetNearestObjectByTag("M3Q04H_Dragon");
    location lDragon = GetLocation(oDragon);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lDragon);
    effect eVisPed = EffectVisualEffect(VFX_IMP_HARM);
//    object oPed = GetNearestObjectByTag("M3QH04DragonP");
    location lPed = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVisPed, lPed);
    int nDead = GetIsDead(oDragon);
    if (nDead == TRUE)
    {
        //* create dead dragon sphere
          CreateItemOnObject("M3Q04G_Sphere2", OBJECT_SELF);
          AssignCommand(oDragon, SetIsDestroyable(TRUE));
          DestroyObject(oDragon, 0.3);
    }
    else
    if (nDead == FALSE)
    {
        //* create dead dragon sphere
          CreateItemOnObject("M3Q04G_Sphere3", OBJECT_SELF);
          AssignCommand(oDragon, SetIsDestroyable(TRUE));
          DestroyObject(oDragon, 0.3);
    }
    DestroyObject(oItem);
  }
}
