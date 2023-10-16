//::///////////////////////////////////////////////
//:: Name: Ballista User Defined
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Needed because on Perception only fires once.
        As long as a PC is in sight - this event should
        be called and the Ballista should keep firing.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 7/02
//:://////////////////////////////////////////////

void main()
{
    if (GetUserDefinedEventNumber() == 1200)
    {
        //object oUser = GetLastUsedBy();
        //if its the bombardier using the ballista - launch a fireball

            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            location lTarget = GetLocation(oPC);
            //Basically - while the PC is in range (seen or heard) - launch fireballs at him.
            if (GetDistanceToObject(oPC) < 30.0)
            {
                ActionCastSpellAtObject(794, oPC, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC);
            }
    }
}
