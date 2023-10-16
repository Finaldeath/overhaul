//::///////////////////////////////////////////////
//:: Name q2d4_death_amp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On death of the amplifier machine..
    Destroy the sound associated with it.
    Destroy the trigger associate with it.
    Free all slaves in the area to go crazy and start
    attacking everyone..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "nw_i0_generic"
void main()
{
    object oSound = GetObjectByTag("snd_q2d4amplifier");
    SoundObjectStop(oSound);
    DestroyObject(oSound);
    object oTrigger = GetObjectByTag("q2d4_amptrigger");
    DestroyObject(oTrigger);

    object oTarget;
    object oCreature = GetFirstObjectInArea();
    while (oCreature != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(oCreature), 9) == "q2dthrall")
        {

            int nRandom = Random(4);
            if (nRandom == 3)
            {
                ChangeToStandardFaction(oCreature, STANDARD_FACTION_COMMONER);
                PlaySpeakSoundByStrRef(85709);//"Freedom!"


            }
            else if (nRandom == 2)
            {
                PlaySpeakSoundByStrRef(85710);//"My mind! So empty! Must find brains!"
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectConfused(), oCreature);

            }
            else
            {
                ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                PlaySpeakSoundByStrRef(85711);//"Gaarrrrghh!"

            }
            SetLocalInt(oCreature, "nFreed", 1);
            DelayCommand(1.0, AssignCommand(oCreature, DetermineCombatRound()));
        }
        oCreature = GetNextObjectInArea();
    }
}
