//q2_ooc_grdduer1
//ooc script to set the Dwarf plot
void main()
{
    object oGord = GetObjectByTag("q2_thegord");
    int nJob = GetLocalInt(GetModule(), "OS_THEGORD_DWARF");
    if(nJob == 20)
    {
        SetLocalInt(GetModule(), "OS_THEGORD_DWARF",30);
    }
}
