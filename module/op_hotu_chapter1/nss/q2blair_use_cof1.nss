//::///////////////////////////////////////////////
//:: Name: q2blair_use_cof1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    //Create a vampire lord when the sarcophagus is used.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith warner
//:: Created On:Nov 18/02
//:://////////////////////////////////////////////


void main()
{

    if (GetLocalInt(OBJECT_SELF,"nUsed") != 1)
    {
        location lLoc = GetLocation(GetNearestObjectByTag("WP_q2blair_vamp1"));
        effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
        object oMummy = CreateObject(OBJECT_TYPE_CREATURE,"q2blair_vampboss",GetLocation(OBJECT_SELF));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy));



        SetLocalInt(OBJECT_SELF,"nUsed",1);
    }


}
