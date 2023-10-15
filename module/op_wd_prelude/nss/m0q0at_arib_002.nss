void main()
{
//* Give key to for Graduation Room Door
    CreateItemOnObject("M0Q0_KEY_DOOR10",GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL",1);
}
