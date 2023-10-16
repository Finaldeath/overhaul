//::///////////////////////////////////////////////
//:: M4MapAHeart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Every few heartbeats will make a catapult explosion
     happen.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

#include "achievement_lib"

void main()
{
    object oPlayer = GetFirstPC();

    if (GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") <= 2)
    {

        object oTarget = GetNearestObjectByTag("M4ATarget", GetObjectByTag("M4ASource"), Random(6)+1);
        if (GetIsObjectValid(oTarget) == FALSE)
        {
            oTarget = GetObjectByTag("M4ATarget");
        }
        AssignCommand(GetObjectByTag("M4ASource"), ActionCastSpellAtObject(SPELL_FIREBALL, oTarget,METAMAGIC_ANY, TRUE));
    }
    else
    // * turns the sound off for the area, replacing with normal city ambient
    if (GetLocalInt(GetModule(), "NW_CITYCORESOUNDOFF") == 0)
    {
        object oLoci = GetObjectByTag("M4ASource");


        AmbientSoundStop(GetArea(oLoci));
        AmbientSoundChangeDay(GetArea(oLoci),  12);
        AmbientSoundChangeNight(GetArea(oLoci),14);
        AmbientSoundPlay(GetArea(oLoci));
     //   AssignCommand(GetFirstPC(), SpeakString("SOUNDOFF"));
        // * turn off sound objects
        SoundObjectStop(GetNearestObjectByTag("BattleCriesGroup", oLoci));
        SoundObjectStop(GetNearestObjectByTag("BoomsDistant", oLoci));
        SoundObjectStop(GetNearestObjectByTag("BuildingCrumblings", oLoci));
        SoundObjectStop(GetNearestObjectByTag("OfficerCallsMenOutside", oLoci));
        SoundObjectStop(GetNearestObjectByTag("PainCriesMenOutside", oLoci));
        SoundObjectStop(GetNearestObjectByTag("PanicCriesGroup", oLoci));
        SoundObjectStop(GetNearestObjectByTag("ShrieksMenOutside", oLoci));

        // * Set ambient sounds levels to 30
        AmbientSoundSetDayVolume(GetArea(oLoci), 30);
        AmbientSoundSetNightVolume(GetArea(oLoci), 30);



        SetLocalInt(GetModule(), "NW_CITYCORESOUNDOFF", 10);

    }

    while(GetIsObjectValid(oPlayer)){
        CheckAchievements(oPlayer, GetModule());
        oPlayer = GetNextPC();
    }
}
