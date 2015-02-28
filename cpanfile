requires "Exporter" => "0";
requires "Inline::Module" => "0";
requires "perl" => "5.006";
requires "strict" => "0";
requires "strictures" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "File::Temp" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::InDistDir" => "0";
  requires "Test::More" => "0";
  requires "perl" => "5.006";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "perl" => "5.006";
};

on 'develop' => sub {
  requires "Test::CPAN::Meta" => "0";
  requires "Test::Pod" => "1.41";
};
