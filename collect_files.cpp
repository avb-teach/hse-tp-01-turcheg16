#include <filesystem>
#include <iostream>
namespace fs=std::filesystem;
int main(int argc,char*argv[]){
    if(argc<3){return 1;}
    fs::path src=argv[1],dst=argv[2];
    if(!fs::is_directory(src)){return 1;}
    fs::create_directories(dst);
    for(const auto&e:fs::recursive_directory_iterator(src))
        if(e.is_regular_file())
            fs::copy_file(e.path(),dst/e.path().filename(),fs::copy_options::overwrite_existing);
    return 0;
}
