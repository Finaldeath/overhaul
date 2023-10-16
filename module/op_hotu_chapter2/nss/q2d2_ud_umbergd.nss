//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d2_ud_umbergd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sometimes have the Umber Hulk Guards cast a
    mind spell visual effect on the thralls
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 18/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //don't do anything if there are no PCs in the area or if everyone has gone hostile
        if (GetAILevel(OBJECT_SELF) == AI_LEVEL_VERY_LOW)
            return;
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            return;

        //Have a 18 second timer between doing these events.
        if (GetLocalInt(OBJECT_SELF, "nMindControlDeActive") == 1)
            return;

        if (Random(3) == 2)
        {
            //Sometimes the Umber Hulk Guards will cast mind spells on the thralls
            object oThrall = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
            if (GetStringLeft(GetTag(oThrall), 7) == "q2dthra" && GetDistanceToObject(oThrall) < 20.0)
            {
                SetLocalInt(OBJECT_SELF, "nMindControlDeActive", 1);
                DelayCommand(18.0, SetLocalInt(OBJECT_SELF, "nMindControlDeActive", 0));
                ClearAllActions();
                ActionCastFakeSpellAtObject(693, oThrall);
            }
        }
    }


}

