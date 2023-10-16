// * spawn in end game portals dynamicallyt
void main()
{
   if (GetLocalInt(GetModule(), "NW_G_MORAGDEAD") == 10 && GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {   int nVis = 1;
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 10);

        CreateObject(OBJECT_TYPE_PLACEABLE, "m4finalportal", GetLocation(OBJECT_SELF));
    }
   if (GetLocalInt(GetModule(), "NW_G_MORAGDEAD") == 10)
   {
       effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
      // ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eShake, GetLocation(OBJECT_SELF));
   }
}
