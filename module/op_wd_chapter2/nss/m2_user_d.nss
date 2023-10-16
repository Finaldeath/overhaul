//::///////////////////////////////////////////////
//:: User Defined
//:: M2_USER_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 9, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 100:
            if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") < 4)
            {
                SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",4);
            }
        break;
    }
}
