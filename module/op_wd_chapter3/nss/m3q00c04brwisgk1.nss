// * wife heads to camp
void main()
{
    SetLocalInt(GetModule(), "NW_G_M3Q02PLOTBRETSFAMILYSAFE",1);
    ExecuteScript("M3Q2C04WIFEGOES", OBJECT_SELF);
}

