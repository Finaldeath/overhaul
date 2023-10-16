//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6AWiz1_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The wizard tries to activate the four golems.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oLever1 = GetObjectByTag("M2Q06PLEVER01");
    object oLever2 = GetObjectByTag("M2Q06PLEVER02");
    object oLever3 = GetObjectByTag("M2Q06PLEVER03");
    object oLever4 = GetObjectByTag("M2Q06PLEVER04");

    switch (nEvent)
    {
        case 600:
/*
            if (GetIsObjectValid(oLever1))
            {
                ActionMoveToObject(oLever1,TRUE);
                ActionInteractObject(oLever1);
            }
            if (GetIsObjectValid(oLever2))
            {
                ActionMoveToObject(oLever2,TRUE);
                ActionInteractObject(oLever2);
            }
            if (GetIsObjectValid(oLever3))
            {
                ActionMoveToObject(oLever3,TRUE);
                ActionInteractObject(oLever3);
            }
            if (GetIsObjectValid(oLever4))
            {
                ActionMoveToObject(oLever4,TRUE);
                ActionInteractObject(oLever4);
            }
*/
        break;
    }
}
