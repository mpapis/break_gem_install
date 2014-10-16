# break gem install

This gem is here to illustrate how to break rubygems gem installation,
it serves as an example for <https://github.com/rubygems/rubygems/issues/1040>.

## Reproducing

```bash
# get the gem and unpack it
gem build break_gem_install.gemspec
mkdir test
cd test
tar xf ../break_gem_install-0.0.1.gem

# unpack parts we need to modify
gzip -d checksums.yaml.gz
chmod +w checksums.yaml
tar xzf data.tar.gz

# this breaks rubygems gem installation
chmod -R 0500 bin/

# pack the data back to rubygems format
rm data.tar.gz
tar czf data.tar.gz bin/

# early cleanup
chmod -R +w bin/
rm -rf bin

# fix the checksums
sha1sum data.tar.gz   # and replace the sum in checksums.yaml
sha512sum data.tar.gz # and replace the sum in checksums.yaml
chmod -w checksums.yaml data.tar.gz
gzip checksums.yaml
rm ../break_gem_install-0.0.1.gem
tar cf ../break_gem_install-0.0.1.gem *

# cleanup
cd ..
rm -rf test
```

now:
```bash
gem push break_gem_install-0.0.1.gem
```
and ready:
```bash
$ gem install break_gem_install
Fetching: break_gem_install-0.0.1.gem (100%)
ERROR:  While executing gem ... (Errno::EACCES)
    Permission denied - /home/mpapis/.rvm/gems/ruby-2.0.0-p576/gems/break_gem_install-0.0.1/bin/PaxHeaders.28779
```
