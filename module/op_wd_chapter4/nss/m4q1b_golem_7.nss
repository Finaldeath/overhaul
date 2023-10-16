//::///////////////////////////////////////////////
//:: M4Q1B_GOLEM_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a portal entrance to Maugrim's sanctuary
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    location lWay = GetLocation(GetObjectByTag("WP_M4Q1_To_B25"));
    object oPortal = CreateObject(OBJECT_TYPE_PLACEABLE,"M4Q1B_B25_PORTAL",lWay);
    AssignCommand(oPortal, ActionCastSpellAtObject(SPELL_FIREBALL, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
}
