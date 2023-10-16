// advance Trip's story global

void main()
{
    int nStory = GetLocalInt(GetModule(), "x2_hen_tripstory");
    SetLocalInt(GetModule(), "x2_hen_tripstory", (nStory + 1));
}
