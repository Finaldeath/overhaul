//::///////////////////////////////////////////////
//:: Name  Use Goblin Catapult
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When used - the ballista will target the nearest PC
    and launch a fireball at his current location
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith W.
//:: Created On:  Nov 7/02
//:://////////////////////////////////////////////


void main()
{
    object oUser = GetLastUsedBy();
    //if its the bombardier using the ballista - launch a fireball
    if (GetIsPC(oUser) == FALSE)
    {
        //FloatingTextStringOnCreature("Ballista 1 Used", GetFirstPC());
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        location lTarget = GetLocation(oPC);
        //Basically - while the PC is in range (seen or heard) - launch fireballs at him.
        if (GetDistanceToObject(oPC) < 30.0)
        {                          //553
            ActionCastSpellAtObject(794, oPC, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC);
        }
    }
    else
    {
        location lSelf = GetLocation(OBJECT_SELF);
        FloatingTextStrRefOnCreature(84132 , oUser, FALSE);
        ActionCastSpellAtLocation(794, lSelf, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lSelf);
    }
}
