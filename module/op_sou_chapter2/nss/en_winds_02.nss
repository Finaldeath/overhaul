//::///////////////////////////////////////////////
//:: Temple of the Winds, 2nd Floor (OnEnter)
//:: En_Winds_02.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the upward leading doors ethereal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        //Identify the doorways leading up.
        object oNE = GetObjectByTag("Winds_02_Door_NE");
        object oSE = GetObjectByTag("Winds_02_Door_SE");
        object oSW = GetObjectByTag("Winds_02_Door_SW");
        object oNW = GetObjectByTag("Winds_02_Door_NW");

        //Make them ethereal.
        effect eEthereal = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
        int bActiveNE = GetLocalInt(oNE, "bActive");
        int bActiveSE = GetLocalInt(oSE, "bActive");
        int bActiveSW = GetLocalInt(oSW, "bActive");
        int bActiveNW = GetLocalInt(oNW, "bActive");
        if (bActiveNE == FALSE &&
            bActiveSE == FALSE &&
            bActiveSW == FALSE &&
            bActiveNW == FALSE)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEthereal, oNE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEthereal, oSE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEthereal, oSW);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEthereal, oNW);
        }
    }
}
