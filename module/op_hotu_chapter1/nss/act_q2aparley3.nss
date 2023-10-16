//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Parley likes PC. Casts Greater Bull Strength
     on PC as reward.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 2, 2003
//:://////////////////////////////////////////////
void main()
{

    SetLocalInt(GetPCSpeaker(),"PARLEYVOUS",40);
    ActionCastSpellAtObject(SPELL_GREATER_BULLS_STRENGTH,GetPCSpeaker(),METAMAGIC_ANY,TRUE);
}
