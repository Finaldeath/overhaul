//q2_ooc_grdcow1
//ooc script to set the cow plot
void main()
{
    object oGord = GetObjectByTag("q2_thegord");
    int nJob = GetLocalInt(GetModule(), "OS_THEGORD_COWS");
    if(nJob == 20)
    {
        SetLocalInt(GetModule(), "OS_THEGORD_COWS",30);
    }
}
