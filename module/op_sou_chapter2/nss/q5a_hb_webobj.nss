//::///////////////////////////////////////////////
//:: Name: q5a_hb_webobj
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On the very first heartbeat of this object
    create a non-harmful web effect around it.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 21/02
//:://////////////////////////////////////////////

void main()
{
     if(GetLocalInt(OBJECT_SELF, "nDone") != 1)
     {
        SetLocalInt(OBJECT_SELF, "nDone", 1);
        effect eWeb = EffectVisualEffect(VFX_DUR_WEB);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeb, OBJECT_SELF);

     }
}
