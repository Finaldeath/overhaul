void main()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"HEARD_ARKLEM");
    SetLocalInt(GetPCSpeaker(),"HEARD_ARKLEM",(iPlot + 1));
}
