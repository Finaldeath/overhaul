//::///////////////////////////////////////////////
//:: Henchman Bardsong Include v0.91
//:: inc_bardsong Modified by Pausanias
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    These functions "fix" the fact that bard henchman only get one bardsong a
    day.  #include this file in your nw_i0_generic script (or add the functions
    to it) and then change TalentBardSong() to TalentBardSongFixed() where it is
    called (not defined or declared) in the generic script.
    Most variables I added are self descriptive.
    GameSeconds inspired by Torlack.
    Also, you will need to update your OnHeartbeat script so that the bard will
    be able to replenish her songs while resting.  Place BardRest() in the first
    if block.
    v0.91 - made temp HP separate effect in TalentBardSongFixed()
*/
//:://////////////////////////////////////////////
//:: Created By: Nifty
//:: Created On: Aug 17, 2002
//:://////////////////////////////////////////////
//void main() {}
int TalentBardSongFixed();
void FakeBardSong();
int GameSeconds();
void BardRest();

// This is the updated TalentBardSong
int TalentBardSongFixed()
{
    int nBardSongDuration = 10 + GetAbilityModifier(ABILITY_CHARISMA);
    nBardSongDuration = FloatToInt(RoundsToSeconds(nBardSongDuration));
    // check for a spell effect, then check if the bard has songs left for the day
    // and is finished with the previous song.  I have no idea what spell this is.
    // That is what was in the original BardSong.
    if(!GetHasSpellEffect(411))
    {
        if ((GetLocalInt(OBJECT_SELF, "nSung") < GetLevelByClass(CLASS_TYPE_BARD)) &&
            (GetLocalInt(OBJECT_SELF, "nTimeSung") < GameSeconds() - nBardSongDuration))
        {
            ClearAllActions();
            FakeBardSong(); // replaces ActionUseFeat(FEAT_BARD_SONG);
            return TRUE;
        }
        /* debugging speech
        if (GetLocalInt(OBJECT_SELF, "nSung") >= GetLevelByClass(CLASS_TYPE_BARD))
            SpeakString("I cannot sing anymore today");
        if (GetLocalInt(OBJECT_SELF, "nTimeSung") >= GameSeconds() - nBardSongDuration)
            SpeakString("I am still singing!"+IntToString(GameSeconds()));
        */
    }
    return FALSE;
}
// This is the BardSong effect verbatim, until the end.  Look for comments there.
void FakeBardSong ()
{
//Declare major variables
    int nLevel = GetLevelByClass(CLASS_TYPE_BARD);
    int nRanks = GetSkillRank(SKILL_PERFORM);
    int nChr = GetAbilityModifier(ABILITY_CHARISMA);
    int nPerform = nRanks;
    int nDuration = 10 + nChr;
    effect eAttack;
    effect eDamage;
    effect eWill;
    effect eFort;
    effect eReflex;
    effect eHP;
    effect eAC;
    effect eSkill;
    int nAttack;
    int nDamage;
    int nWill;
    int nFort;
    int nReflex;
    int nHP;
    int nAC;
    int nSkill;
    //SpeakString("Level: " + IntToString(nLevel) + " Ranks: " + IntToString(nRanks));
    if(nPerform >= 60 && nLevel >= 20)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 32;
        nAC = 5;
        nSkill = 10;
    }
    else if(nPerform >= 55 && nLevel >= 20)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 30;
        nAC = 5;
        nSkill = 9;
    }
    else if(nPerform >= 50 && nLevel >= 20)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 28;
        nAC = 5;
        nSkill = 8;
    }
    else if(nPerform >= 45 && nLevel >= 19)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 26;
        nAC = 5;
        nSkill = 7;
    }
    else if(nPerform >= 40 && nLevel >= 18)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 24;
        nAC = 5;
        nSkill = 6;
    }
    else if(nPerform >= 35 && nLevel >= 17)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 22;
        nAC = 5;
        nSkill = 5;
    }
    else if(nPerform >= 30 && nLevel >= 16)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 20;
        nAC = 5;
        nSkill = 4;
    }
    else if(nPerform >= 24 && nLevel >= 15)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 2;
        nFort = 2;
        nReflex = 2;
        nHP = 16;
        nAC = 4;
        nSkill = 3;
    }
    else if(nPerform >= 21 && nLevel >= 14)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 16;
        nAC = 3;
        nSkill = 2;
    }
    else if(nPerform >= 18 && nLevel >= 12)
    {
        nAttack = 2;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 8;
        nAC = 2;
        nSkill = 2;
    }
    else if(nPerform >= 15 && nLevel >= 8)      {
        nAttack = 2;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 8;
        nAC = 0;
        nSkill = 1;
    }
    else if(nPerform >= 12 && nLevel >= 6)
    {
        nAttack = 1;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 0;
        nAC = 0;
        nSkill = 1;
    }
    else if(nPerform >= 9 && nLevel >= 3)
    {
        nAttack = 1;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }
    else if(nPerform >= 6 && nLevel >= 2)
    {
        nAttack = 1;
        nDamage = 1;
        nWill = 1;
        nFort = 0;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }
    else if(nPerform >= 3 && nLevel >= 1)
    {
        nAttack = 1;
        nDamage = 1;
        nWill = 0;
        nFort = 0;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }
    effect eVis = EffectVisualEffect(VFX_DUR_BARD_SONG);
    eAttack = EffectAttackIncrease(nAttack);
    eDamage = EffectDamageIncrease(nDamage, DAMAGE_TYPE_BLUDGEONING);
    effect eLink = EffectLinkEffects(eAttack, eDamage);
    if(nWill > 0)
    {
        eWill = EffectSavingThrowIncrease(SAVING_THROW_WILL, nWill);
        eLink = EffectLinkEffects(eLink, eWill);
    }
    if(nFort > 0)
    {
        eFort = EffectSavingThrowIncrease(SAVING_THROW_FORT, nFort);
        eLink = EffectLinkEffects(eLink, eFort);
    }
    if(nReflex > 0)
    {
        eReflex = EffectSavingThrowIncrease(SAVING_THROW_REFLEX, nReflex);
        eLink = EffectLinkEffects(eLink, eReflex);
    }
    if(nHP > 0)
    {
        //SpeakString("HP Bonus " + IntToString(nHP));
        eHP = EffectTemporaryHitpoints(nHP);
        eHP = ExtraordinaryEffect(eHP);  // create separate effect for HP
        // eLink = EffectLinkEffects(eLink, eHP); don't link the HP effect
    }
    if(nAC > 0)
    {
        eAC = EffectACIncrease(nAC, AC_DODGE_BONUS);
        eLink = EffectLinkEffects(eLink, eAC);
    }
    if(nSkill > 0)
    {
        eSkill = EffectSkillIncrease(SKILL_ALL_SKILLS, nSkill);
        eLink = EffectLinkEffects(eLink, eSkill);
    }
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    eLink = EffectLinkEffects(eLink, eDur);
    effect eImpact = EffectVisualEffect(VFX_IMP_HEAD_SONIC);
    effect eFNF = EffectVisualEffect(VFX_FNF_LOS_NORMAL_30);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFNF, GetLocation(OBJECT_SELF));
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oTarget))
    {
        if(!GetHasFeatEffect(FEAT_BARD_SONGS, oTarget))
        {
            if(oTarget == OBJECT_SELF)
            {
                effect eLinkBard = EffectLinkEffects(eLink, eVis);
                eLinkBard = ExtraordinaryEffect(eLinkBard);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkBard, oTarget, RoundsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, RoundsToSeconds(nDuration));
            }
            else if(GetIsFriend(oTarget))
            {
                eLink = ExtraordinaryEffect(eLink);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpact, oTarget);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, RoundsToSeconds(nDuration));
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, GetLocation(OBJECT_SELF));
    }
    // Here is the modification to write locals for songs per day and the time
    // the bard started her song.  These are used in TalentBardSongFixed()
    int nSung = GetLocalInt(OBJECT_SELF, "nSung");
    SetLocalInt(OBJECT_SELF, "nSung", ++nSung);
    SetLocalInt(OBJECT_SELF, "nTimeSung", GameSeconds());
}
// Torlack from the NWN boards inspired this funtion.  I made some modifications.
// It now has a base for month and day.  This could be used with along with a script
// for OnModuleLoad to get the number of seconds elapsed since the module started.
// Otherwise, it just gets the seconds from the first time the function is called.
int GameSeconds()
{
    int nBaseYear = GetLocalInt (GetModule(), "TIMEMARK_BASEYEAR");
    int nBaseMonth = GetLocalInt (GetModule(), "TIMEMARK_BASEMONTH");
    int nBaseDay = GetLocalInt (GetModule(), "TIMEMARK_BASEDAY");
    if (nBaseYear == 0)
    {
        nBaseYear = GetCalendarYear();
        SetLocalInt (GetModule (), "TIMEMARK_BASEYEAR", nBaseYear);
    }
    if (nBaseMonth == 0)
    {
        nBaseMonth = GetCalendarMonth();
        SetLocalInt (GetModule (), "TIMEMARK_BASEMONTH", nBaseMonth);
    }
    if (nBaseDay == 0)
    {
        nBaseDay = GetCalendarDay();
        SetLocalInt (GetModule (), "TIMEMARK_BASEDAY", nBaseDay);
    }
    int nDay =
        ((GetCalendarYear() - nBaseYear) * 28 * 12) +
        ((GetCalendarMonth() - nBaseMonth) * 28) +
        ((GetCalendarDay() - nBaseDay));

    // Pausanias: as of v1.24, an additive constant (here 100) seems
    // necessary to get this to work.
    return
        FloatToInt (HoursToSeconds (nDay * 24 + GetTimeHour ())) +
        (GetTimeMinute () * 60) +
        (GetTimeSecond ()+500);
}
// this resets the bards songs per day while she rests.
void BardRest()
{
    if (GetCurrentAction(OBJECT_SELF) == ACTION_REST &&
        GetLevelByClass(CLASS_TYPE_BARD) > 0)
    {
        SetLocalInt(OBJECT_SELF, "nSung", 0);
    }
}

