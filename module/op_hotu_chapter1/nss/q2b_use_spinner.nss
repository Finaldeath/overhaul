//::///////////////////////////////////////////////
//:: Name
//:: FileName  q2b_use_spinner
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When clicked on - the spinner and corresponding
     gargoyole will turn 15 degrees clockwise.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 5/02
//:://////////////////////////////////////////////


void main()
{
    float fCurrentFacing = GetFacing(OBJECT_SELF);
    object oGarg = GetObjectByTag("q2b_garg_" + GetStringRight(GetTag(OBJECT_SELF),1));
    fCurrentFacing = fCurrentFacing + 30.0;
    //DEBUG

    //Apply Correction for small floating point errors
    if (fCurrentFacing > 28.0 && fCurrentFacing < 32.0)
    {
        fCurrentFacing = 30.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 58.0 && fCurrentFacing < 62.0)
    {
        fCurrentFacing = 60.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 88.0 && fCurrentFacing < 92.0)
    {
        fCurrentFacing = 90.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 118.0 && fCurrentFacing < 122.0)
    {
        fCurrentFacing = 120.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 148.0 && fCurrentFacing < 152.0)
    {
        fCurrentFacing = 150.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 178.0 && fCurrentFacing < 189.0)
    {
        fCurrentFacing = 180.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 208.0 && fCurrentFacing < 212.0)
    {
        fCurrentFacing = 210.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }                                  //for initial placement
    else if (fCurrentFacing > 238.0 && fCurrentFacing < 245.0)
    {
        fCurrentFacing = 240.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 268.0 && fCurrentFacing < 272.0)
    {
        fCurrentFacing = 270.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 298.0 && fCurrentFacing < 302.0)
    {
        fCurrentFacing = 300.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 328.0 && fCurrentFacing < 332.0)
    {
        fCurrentFacing = 330.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 358.0 || fCurrentFacing < 362.0)
    {
        fCurrentFacing = 0.0;
        AssignCommand(oGarg, SetFacing(fCurrentFacing + 180.0));
        SetFacing(fCurrentFacing);
    }

}
