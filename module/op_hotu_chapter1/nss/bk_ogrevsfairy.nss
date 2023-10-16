//::///////////////////////////////////////////////
//:: bk_ogrevsfairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This trigger spawns in a pair of ogre vs. fairy monsters to fill in some of the empty areas in Undermountain.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: August 28, 2003
//:://////////////////////////////////////////////
void SpawnTrollVsFairy(location lLoc)
{
    object o1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2troll1", lLoc);
    object o2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_evilgrig", lLoc);
    object o3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_evilgrig", lLoc);
    AssignCommand(o1, ActionAttack(o2));
    AssignCommand(o2, ActionAttack(o1));
    AssignCommand(o3, ActionAttack(o1));
}

void SpawnOgreVsHarpy(location lLoc)
{
    object o1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2ogre2", lLoc);
    object o2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2harpy1", lLoc);
    AssignCommand(o1, ActionAttack(o2));
    AssignCommand(o2, ActionAttack(o1));
}

void main()
{
    if (GetIsPC(GetEnteringObject()) == FALSE)
        return;

    object oNearestWay = GetNearestObjectByTag("bk_way_ogrevs");
    if (GetIsObjectValid(oNearestWay) == TRUE)
    {
        location lLoc = GetLocation(oNearestWay);
        int nRandom = Random(2) + 1;
        switch (nRandom)
        {
            case 1:
                SpawnTrollVsFairy(lLoc);
            break;
            case 2:
                SpawnOgreVsHarpy(lLoc);
            break;
        }
    }

    // * Destroy Trigger
    DestroyObject(OBJECT_SELF);
}
