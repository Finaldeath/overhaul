//::///////////////////////////////////////////////
//:: Door Levers, 3rd Floor, Temple of Winds (Heartbeat)
//:: Hb_Winds3Levers.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the VFX to the fake levers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 21, 2003
//:://////////////////////////////////////////////

void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (iDoOnce == FALSE)
    {
        string sMyTag = GetTag(OBJECT_SELF);
        string sTarget = sMyTag+"_Fake";
        effect eVFX = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
        int iNth = 1;
        object oTarget = GetNearestObjectByTag(sTarget, OBJECT_SELF, iNth);

        while (iNth <= 3)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTarget);

            iNth++;
            oTarget = GetNearestObjectByTag(sTarget, OBJECT_SELF, iNth);
        }

        //Flag the DoOnce.
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);
    }
}
