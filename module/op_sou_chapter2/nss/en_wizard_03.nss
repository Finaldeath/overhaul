//::///////////////////////////////////////////////
//:: Plane of Shadow (OnEnter)
//:: En_Wizard_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Turn the portal VFX on for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only worry about the player's entry
    object oPC = GetEnteringObject();
    int bPortalsOn = GetLocalInt(OBJECT_SELF, "bPortalsOn");

    if (GetIsPC(oPC) == TRUE && bPortalsOn == FALSE)
    {
        object oRefPoint = GetObjectByTag("Reference_Wizard_03");
        //Create shadow vfx on placeables the first time in the area..
        if (GetLocalInt(OBJECT_SELF, "CreateShadowVFX") != 1)
        {
            SetLocalInt(OBJECT_SELF, "CreateShadowVFX", 1);
            //shadow vfx
            effect eEffect = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            int nCount = 1;
            object oThing = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount);
            while (oThing != OBJECT_INVALID)
            {
                if (GetStringLeft(GetTag(oThing), 5) == "shdfx")
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oThing);
                }
                nCount++;
                oThing = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount);
            }

            //anti light vfx
            effect eEffect2 = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);
            int nCount2 = 1;
            object oThing2 = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount2);
            while (oThing2 != OBJECT_INVALID)
            {
                if (GetStringRight(GetTag(oThing2), 6) == "alight")
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect2, oThing2);
                }
                nCount2++;
                oThing2 = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount2);
            }

        }

        SetLocalInt(OBJECT_SELF, "bPortalsOn", TRUE);

        //Parse through all 23 portals in the area and signal their UD event.

        SignalEvent(GetNearestObjectByTag("ShadowPortal_01", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_02", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_03", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_04", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_05", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_06", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_07", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_08", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_09", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_10", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_11", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_12", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_13", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_14", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_15", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_16", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_17", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_18", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_19", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_20", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_21", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_22", oRefPoint), EventUserDefined(5006));
        SignalEvent(GetNearestObjectByTag("ShadowPortal_23", oRefPoint), EventUserDefined(5006));

        //Add journal entry
        int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce_Journ_Wizard_40");
        if (bDoOnce == FALSE)
        {
            //AddJournalQuestEntry("Journ_Wizard_40", 1, oPC, TRUE, TRUE);
            SetLocalInt(OBJECT_SELF, "bDoOnce_Journ_Wizard_40", TRUE);
        }
    }
}
