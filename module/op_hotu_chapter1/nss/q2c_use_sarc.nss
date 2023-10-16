//Create a mummylord and two mummies when the sarcophagus is used.

void main()
{

    if (GetLocalInt(OBJECT_SELF,"nUsed") != 1)
    {
        location lLoc = GetLocation(GetNearestObjectByTag("WP_q2cmummy"));
        effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
        object oMummy = CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMYBOSS",GetLocation(OBJECT_SELF));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy));

        location lLoc2 =  GetLocation(GetNearestObjectByTag("WP_q2cmummy1"));
        object oMummy1 = CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMY",lLoc2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy1));

        location lLoc3 =  GetLocation(GetNearestObjectByTag("WP_q2cmummy2"));
        object oMummy2 = CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMY",lLoc3);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy2));

        SetLocalInt(OBJECT_SELF,"nUsed",1);

        DestroyObject(OBJECT_SELF, 2.0);
    }


}
