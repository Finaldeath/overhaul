// if plot not done, speaker agreed to plot although was not the original PC to do so

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Evaine_Plot") < 100 &&
              GetLocalInt(GetPCSpeaker(),"Evaine_Plot_Explained") == 1;
    return iResult;
}
