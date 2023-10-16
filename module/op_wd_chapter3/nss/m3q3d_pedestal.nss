//::///////////////////////////////////////////////
//:: M3Q3D_PEDESTAL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the pedestals in M3Q3D to say their description when clicked.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 3, 2002
//:://////////////////////////////////////////////

void main()
{
/*    int nString;
    if (GetTag(OBJECT_SELF)=="M3Q3PedPurple")
    {
        nString = 58336;
    }
    else if (GetTag(OBJECT_SELF)=="M3Q3PedWhite")
    {
        nString = 58337;
    }
    else if (GetTag(OBJECT_SELF)=="M3Q3PedBlue")
    {
        nString = 58338;
    }
    else if (GetTag(OBJECT_SELF)=="M3Q3PedGreen")
    {
        nString = 58339;
    }
    else if (GetTag(OBJECT_SELF)=="M3Q3PedStar")
    {
        nString = 58340;
    }*/
    if(GetLocalInt(GetLastUsedBy(),"NW_G_M3Q3D_PEDESTAL")==0)
    {
        ActionSpeakStringByStrRef(58340);
        SetLocalInt(GetLastUsedBy(),"NW_G_M3Q3D_PEDESTAL",1);
    }
}
