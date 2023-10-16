//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: q2d_ud_drowwiz
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 199)
    {
        object oTarget = GetObjectByTag("q2dn_ballista1");
        if (GetIsObjectValid(oTarget) == FALSE)
            oTarget = GetObjectByTag("q2dn_ballista2");

        ClearAllActions(TRUE);
        //ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC);

        ActionCastSpellAtObject(SPELL_FIREBALL, oTarget, METAMAGIC_ANY, TRUE);
        SignalEvent(oTarget, EventUserDefined(199));
    }

    return;

}
