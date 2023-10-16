void main()
{
if((GetTag(GetInventoryDisturbItem()) == ("M3Q3DGEM003"))
&& GetLocalInt(OBJECT_SELF,"M3Q3PurpleLight") == 0)
    {
     effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
     ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF),3.0);
      //* Add effect before destroying Light
      location lWay = GetLocation(GetObjectByTag("WP_M3Q3D_PEDPURP"));
     CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q3D_SPARKPURP",lWay);
     DestroyObject(GetInventoryDisturbItem());
     SetLocalInt(OBJECT_SELF,"M3Q3PurpleLight",1);
     SignalEvent(GetObjectByTag("M3Q3PedStar"),EventUserDefined(300));
    }
    else if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED &&
        GetTag(GetInventoryDisturbItem()) != ("M3Q3DGEM003")
            && GetTag(GetInventoryDisturbItem()) !=("M3Q3D_PED_PURPLE"))
    {
        object oPC = GetLastDisturbed();
        effect eDam = EffectDamage(10);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,oPC);
        effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,OBJECT_SELF);
        ActionSpeakStringByStrRef(66116);
    }
}
