//q2_ooc_grdarch1
//ooc script to set the archaeologist plot
void main()
{
    object oGord = GetObjectByTag("q2_thegord");
    int nJob = GetLocalInt(GetModule(), "OS_THEGORD_ARCH");
    if(nJob == 20)
    {
        SetLocalInt(GetModule(), "OS_THEGORD_ARCH",30);
    }
}
